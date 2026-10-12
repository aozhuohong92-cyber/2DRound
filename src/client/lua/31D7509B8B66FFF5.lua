HeroResonateTabEmpowermentPanel = class("HeroResonateTabEmpowermentPanel", function ()
	return ccui.Widget:create()
end)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = RoleController:getInstance():getRoleVo()

function HeroResonateTabEmpowermentPanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroResonateTabEmpowermentPanel.config(slot0)
	slot0.talent_skill_list = {}

	if Config.ResonateData.data_const.empowerment_span then
		slot0.empowerment_span = slot1.val
	else
		slot0.empowerment_span = 24
	end
end

function HeroResonateTabEmpowermentPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_resonate_tab_empowerment_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.look_btn = slot0.main_container:getChildByName("look_btn")

	slot0.look_btn:setVisible(false)

	slot0.hero_node_1 = slot0.main_container:getChildByName("hero_node_1")
	slot0.hero_node_2 = slot0.main_container:getChildByName("hero_node_2")
	slot0.hero_item_1 = HeroExhibitionItem.new(0.7, false)

	slot0.hero_node_1:addChild(slot0.hero_item_1)

	slot0.hero_item_2 = HeroExhibitionItem.new(0.8, true, nil, true)

	slot0.hero_item_2:addCallBack(function ()
		uv0:onClickSelectHeroBtn()
	end)
	slot0.hero_node_2:addChild(slot0.hero_item_2)

	slot0.hero_item_tips = createRichLabel(20, cc.c4b(255, 234, 198, 255), cc.p(0, 1), cc.p(-60, -60), nil, nil, 1900)

	slot0.hero_node_2:addChild(slot0.hero_item_tips)

	slot0.item_node = slot0.main_container:getChildByName("item_node")
	slot0.cost_item = BackPackItem.new(false, true, false, 0.8, false, true, false)

	slot0.cost_item:setDefaultTip(true, nil, nil, 1)
	slot0.item_node:addChild(slot0.cost_item)

	slot3 = {}

	for slot7, slot8 in pairs(Config.PartnerSkillData.data_partner_skill_pos or {}) do
		uv0(slot3, slot8)
	end

	function slot7(slot0, slot1)
		return slot0.pos < slot1.pos
	end

	table.sort(slot3, slot7)

	slot0.config_list = slot3
	slot0.skill_item_list = {}

	for slot7 = 1, 3 do
		slot8 = slot3[slot7]
		slot9 = slot0.main_container:getChildByName("skill_panel" .. slot7)

		slot9:setScale(0.8)

		slot10 = {
			icon = slot9:getChildByName("icon"),
			lock_icon = slot9:getChildByName("lock_icon"),
			skill_name_bg = slot9:getChildByName("skill_name_bg"),
			skill_level_bg = slot9:getChildByName("skill_level_bg"),
			redPoint = slot9:getChildByName("redPoint")
		}

		slot10.redPoint:setVisible(false)

		slot10.skill_name = slot9:getChildByName("skill_name")
		slot10.skill_level = slot9:getChildByName("skill_level")

		registerButtonEventListener(slot9, function ()
			uv0:onSkillClickByIndex(uv1, uv2)
		end, false, 1)

		slot0.skill_item_list[slot7] = slot10
	end

	slot0.limit_time = slot0.main_container:getChildByName("limit_time")

	slot0.limit_time:getChildByName("tips"):setString(uv1(TI18N("限时%s"), TimeTool.getDayOrHour(slot0.empowerment_span * 60)))

	slot0.power_click = slot0.main_container:getChildByName("power_click")
	slot0.power = slot0.power_click:getChildByName("power")

	slot0:setPowerValue(0)
	slot0.limit_time:setVisible(false)
	slot0.power_click:setVisible(false)

	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.hero_star_tips = createRichLabel(20, cc.c4b(255, 234, 198, 255), cc.p(0.5, 0.5), cc.p(360, 331), nil, nil, 1900)

	slot0.bottom_panel:addChild(slot0.hero_star_tips)

	slot0.change_count_label = createRichLabel(22, cc.c4b(255, 255, 15, 255), cc.p(1, 0.5), cc.p(706, 143), nil, nil, 1900)

	slot0.bottom_panel:addChild(slot0.change_count_label)

	slot0.resonate_btn = slot0.bottom_panel:getChildByName("resonate_btn")
	slot0.resonate_btn_label = slot0.resonate_btn:getChildByName("label")

	slot0.resonate_btn_label:setString(TI18N("赋能创造"))

	slot6 = slot0.bottom_panel:getChildByName("cost_icon_1")

	slot6:setScale(0.8)

	slot7 = slot0.bottom_panel:getChildByName("cost_txt_1")

	slot7:setString("")

	slot0.cost_icon = {
		slot6
	}
	slot0.cost_txt = {
		slot7
	}
end

function HeroResonateTabEmpowermentPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.resonate_btn, function ()
		uv0:onClickResonateBtn()
	end, true, 2)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if uv0.parent and uv0.parent.is_move_effect then
			return
		end

		if Config.ResonateData.data_const.empowerment_rule_tips then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 2)

	if slot0.hero_resonate_empowerment_event == nil then
		slot0.hero_resonate_empowerment_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Empowerment_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0:setScdata(slot0)
		end)
	end

	if slot0.hero_resonate_empowerment_success_event == nil then
		slot0.hero_resonate_empowerment_success_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Empowerment_Success_Event, function (slot0)
			uv0.select_hero_vo = nil
			uv0.talent_skill_list = {}

			uv0:initSelectHeroInfo()
			uv0:initSkillItemList()
			uv0:setBtnstatus()
			uv0:showEffect(PlayerAction.action_1, true)
		end)
	end

	if slot0.hero_resonate_skill_list_event == nil then
		slot0.hero_resonate_skill_list_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Skill_List_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0.dic_had_skill = {}

			for slot4, slot5 in ipairs(slot0.skills) do
				uv0.dic_had_skill[slot5.skill_id] = 1
			end
		end)
	end

	if slot0.select_hero_event == nil then
		slot0.select_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Select_Hero_Event, function (slot0, slot1)
			if slot1 and slot1 == HeroConst.SelectHeroType.eResonateEmpowerment then
				if slot0 == nil or next(slot0) == nil then
					uv0.select_hero_vo = nil
					uv0.talent_skill_list = {}

					uv0:initSelectHeroInfo()
					uv0:initSkillItemList()
					uv0:setBtnstatus()
				else
					for slot5, slot6 in pairs(slot0) do
						if uv0.select_hero_vo and uv0.select_hero_vo.id == slot6.id then
							uv0.select_hero_vo = nil
						else
							uv0.select_hero_vo = slot6

							uv1:sender26423(slot6.id, {})
						end

						uv0:initSelectHeroInfo()
						uv0:initSkillItemList()
						uv0:setBtnstatus()

						break
					end
				end
			end
		end)
	end

	if slot0.select_skill_event == nil then
		slot0.select_skill_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Select_Skill_Event, function (slot0, slot1)
			if slot0 then
				uv0.talent_skill_list[slot0] = slot1

				uv0:initSkillItemList()

				if uv0.select_hero_vo then
					slot2 = {}

					if uv0.talent_skill_list then
						for slot6, slot7 in ipairs(uv0.talent_skill_list) do
							uv1(slot2, {
								pos = slot6,
								skill_id = slot7
							})
						end
					end

					uv2:sender26423(uv0.select_hero_vo.id, slot2)
				end
			end
		end)
	end

	if slot0.hero_power_event == nil then
		slot0.hero_power_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Hero_Power_Event, function (slot0)
			if not slot0 then
				return
			end

			if uv0.select_hero_vo and uv0.select_hero_vo.id == slot0.partner_id then
				uv0:setPowerValue(slot0.power)
			end
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateCostInfo()
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateCostInfo()
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateCostInfo()
			end
		end)
	end

	if uv2 ~= nil and slot0.role_lev_event == nil then
		slot0.role_lev_event = uv2:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "coin" then
				uv0:updateCostInfo()
			end
		end)
	end
end

function HeroResonateTabEmpowermentPanel.onClickSelectHeroBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.star <= 5 then
		return
	end

	slot1 = {
		select_condition = {}
	}
	slot1.select_condition.star_start = 4
	slot1.select_condition.star_end = slot0.scdata.star
	slot1.select_condition.camp_type = 0
	slot1.select_condition.bid = 0
	slot1.select_count = 1
	slot1.dic_selected = {}

	if slot0.select_hero_vo then
		slot1.dic_selected[slot0.select_hero_vo.id] = slot0.select_hero_vo
	end

	slot1.form_type = HeroConst.SelectHeroType.eResonateEmpowerment
	slot1.tips = uv0(TI18N("请选择下列<div fontcolor=#249003>%s星</div>至<div fontcolor=#249003>%s星</div>的英雄作为赋能创造的取样"), slot1.select_condition.star_start, slot1.select_condition.star_end)

	uv1:openHeroSelectHeroPanel(true, slot1)
end

function HeroResonateTabEmpowermentPanel.onSkillClickByIndex(slot0, slot1, slot2)
	if not slot0.select_hero_vo then
		message(TI18N("请先选择英雄"))

		return
	end

	if not slot0.new_hero_vo then
		return
	end

	slot3, slot4 = uv0:checkOpenTanlentByconfig(slot2, slot0.new_hero_vo)

	if not slot3 then
		message(slot4)

		return
	end

	for slot9, slot10 in pairs(slot0.talent_skill_list) do
		if slot9 == slot1 then
			-- Nothing
		else
			slot5.dic_other_skill[slot10] = true
		end
	end

	uv1:openHeroResonateSelectTalentSkillPanel(true, {
		pos = slot1,
		dic_had_skill = slot0.dic_had_skill,
		dic_other_skill = {},
		career = slot0.new_hero_vo.type,
		select_skill_id = slot10
	})
end

function HeroResonateTabEmpowermentPanel.onClickResonateBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.num <= 0 then
		message(TI18N("赋能次数不足"))

		return
	end

	if not slot0.select_hero_vo then
		return
	end

	if slot0.scdata.star <= 0 then
		return
	end

	if slot0.is_click_resonate then
		return
	end

	if not slot0.is_show_redpoint then
		slot0:sendResonate()

		return
	end

	if slot0.item_sound ~= nil then
		AudioManager:getInstance():removeEffectByData(slot0.item_sound)
	end

	slot0.item_sound = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_get02", false)
	slot0.is_click_resonate = true

	slot0:showEffect(PlayerAction.action_2, false)
end

function HeroResonateTabEmpowermentPanel.sendResonate(slot0)
	if not slot0.scdata then
		return
	end

	if not slot0.select_hero_vo then
		return
	end

	if slot0.scdata.star <= 0 then
		return
	end

	slot1 = slot0.select_hero_vo.id
	slot2 = {}

	if slot0.talent_skill_list then
		for slot6, slot7 in pairs(slot0.talent_skill_list) do
			uv0(slot2, {
				pos = slot6,
				skill_id = slot7
			})
		end
	end

	uv1:sender26421(slot1, slot2)
end

function HeroResonateTabEmpowermentPanel.setData(slot0, slot1)
	slot0.parent = slot1

	if slot0.scdata == nil then
		uv0:sender26420()
	end

	slot0.talent_skill_list = {}
	slot0.select_hero_vo = nil

	slot0:initSelectHeroInfo()
end

function HeroResonateTabEmpowermentPanel.setPowerValue(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.power:setString(slot1)
end

function HeroResonateTabEmpowermentPanel.setScdata(slot0, slot1)
	slot0.scdata = slot1
	slot0.talent_skill_list = {}

	slot0:initSkillItemList()
	slot0:updateCostInfo()
	slot0:setBtnstatus()

	if slot0.change_count_label then
		slot0.change_count_label:setString(uv0(TI18N("<div fontcolor=#ffffff outline=2,#000000>剩余赋能次数:</div><div fontcolor=#90f34e outline=2,#000000> %s<div>"), slot1.num))
	end

	slot0:showEffect(PlayerAction.action_1, true)
end

function HeroResonateTabEmpowermentPanel.showEffect(slot0, slot1, slot2)
	slot3 = slot1 or PlayerAction.action_1

	if slot0.record_action == nil or slot0.record_action ~= slot3 then
		slot0.record_action = slot3

		if slot0.change_effect == nil then
			slot0.change_effect = createEffectSpine("E24316", cc.p(356, 640), cc.p(0.5, 0.5), slot2 or false, slot3, function ()
				uv0:effectSpineCompleteAction()
			end)

			slot0.main_container:addChild(slot0.change_effect, 1)
		else
			slot0.change_effect:setAnimation(0, slot3, slot4)
		end
	end
end

function HeroResonateTabEmpowermentPanel.effectSpineCompleteAction(slot0)
	slot0:showEffect(PlayerAction.action_1, true)

	if slot0.is_click_resonate then
		slot0.is_click_resonate = false

		slot0:sendResonate()
	end
end

function HeroResonateTabEmpowermentPanel.setBtnstatus(slot0)
	if slot0.scdata and slot0.scdata.star then
		if (uv0.resonate_max_partner_lev or 0) >= 30 then
			slot0.hero_star_tips:setString(uv1(TI18N("<div fontcolor=#ffeac6 outline=2,#643223>赋能的目标星级为供奉英雄历史最高平均星级(当前<div fontcolor=#90f34e outline=2,#643223>%s</div>星)</div>"), slot0.scdata.star))

			if slot0.select_hero_vo == nil then
				slot0.hero_item_tips:setString(TI18N("<div fontcolor=#ffeac6 outline=2,#643223>请放入赋能对象英雄<div>"))
				slot0.hero_item_tips:setPositionX(-80)
				slot0.resonate_btn_label:setString(TI18N("暂无赋能对象"))
				slot0.resonate_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
				setChildUnEnabled(true, slot0.resonate_btn)
				slot0.resonate_btn:setTouchEnabled(false)
			else
				slot0.hero_item_tips:setString("")
				setChildUnEnabled(false, slot0.resonate_btn)
				slot0.resonate_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
				slot0.resonate_btn:setTouchEnabled(true)
				slot0.resonate_btn_label:setString(TI18N("赋能创造"))
			end
		else
			slot0.hero_item_tips:setString(uv1(TI18N("<div fontcolor=#f23b3b outline=2,#000000>需圣阵中英雄\n总星级达30(%s/30)</div>"), slot1))
			slot0.hero_item_tips:setPositionX(-60)
			slot0.hero_star_tips:setString("")
			slot0.resonate_btn_label:setString(TI18N("暂无赋能对象"))
			slot0.resonate_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot0.resonate_btn)
			slot0.resonate_btn:setTouchEnabled(false)
		end
	end
end

function HeroResonateTabEmpowermentPanel.initSelectHeroInfo(slot0)
	if slot0.select_hero_vo then
		slot0.hero_item_2:setData(slot0.select_hero_vo)
		slot0.hero_item_2:showAddIcon(false)
		slot0.hero_item_2:showRedPoint(false)
		slot0.limit_time:setVisible(true)
		slot0.power_click:setVisible(true)
		slot0.hero_item_1:setVisible(true)

		slot0.new_hero_vo = deepCopy(slot0.select_hero_vo)
		slot0.new_hero_vo.star = slot0.scdata.star
		slot3 = 1

		if Config.PartnerData.data_partner_star(getNorKey(slot0.new_hero_vo.bid, slot0.new_hero_vo.star)) then
			slot3 = slot2.lev_max
		end

		if uv0.resonate_cystal_lev and slot3 < uv0.resonate_cystal_lev then
			slot3 = uv0.resonate_cystal_lev
		end

		slot0.new_hero_vo.lev = slot3

		slot0.hero_item_1:setData(slot0.new_hero_vo)
		slot0:updateSpine(slot0.new_hero_vo, false)
	else
		slot0.hero_item_2:setData(nil)
		slot0.hero_item_2:showAddIcon(true)
		slot0.hero_item_2:showRedPoint(slot0.is_show_redpoint == true)
		slot0.hero_item_1:setData(nil)

		if slot0.spine then
			slot0.spine:removeFromParent()

			slot0.spine = nil
		end

		slot0.record_spine_bid = nil
		slot0.record_spine_star = nil
		slot0.record_spine_skin = nil

		slot0.limit_time:setVisible(false)
		slot0.power_click:setVisible(false)
		slot0.hero_item_1:setVisible(false)
	end
end

function HeroResonateTabEmpowermentPanel.updateSpine(slot0, slot1, slot2)
	if slot0.record_spine_bid and slot0.record_spine_bid == slot1.bid and slot0.record_spine_star and slot0.record_spine_star == slot1.star and slot0.record_spine_skin and slot0.record_spine_skin == slot1.use_skin then
		if slot2 and slot0.spine then
			slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.FadeIn:create(0.2)))
		end

		return
	end

	slot0.record_spine_bid = slot1.bid
	slot0.record_spine_star = slot1.star
	slot0.record_spine_skin = slot1.use_skin

	function slot3()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.partner, uv1, nil, {
				scale = 1,
				skin_id = uv1.use_skin
			})

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setPosition(cc.p(360, 655))
			uv0.spine:setAnchorPoint(cc.p(0, 0))
			uv0.spine:setScale(0.6)
			uv0.main_container:addChild(uv0.spine, 3)

			if uv0.select_hero_vo.use_skin ~= 0 and Config.PartnerSkinData.data_skin_info[uv1.use_skin] and slot0.hero_camp_res == "null" then
				uv0.spine:showShadowUI(false)
			end

			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if slot0.spine then
		slot0.can_click_btn = false

		slot0.spine:setCascade(true)
		slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
			doStopAllActions(uv0.spine)
			uv0.spine:removeFromParent()

			uv0.spine = nil
			uv0.can_click_btn = true

			uv1()
		end)))
	else
		slot3()
	end
end

function HeroResonateTabEmpowermentPanel.initSkillItemList(slot0)
	if not slot0.scdata then
		return
	end

	for slot4, slot5 in ipairs(slot0.config_list) do
		if slot0.skill_item_list[slot4] then
			if slot0.talent_skill_list[slot5.pos] then
				if Config.SkillData.data_get_skill(slot0.talent_skill_list[slot5.pos]) then
					slot0.skill_item_list[slot4].icon:setVisible(true)
					slot0.skill_item_list[slot4].skill_level_bg:setVisible(true)
					slot0.skill_item_list[slot4].skill_level:setVisible(true)
					slot0.skill_item_list[slot4].skill_name_bg:setVisible(true)
					slot0.skill_item_list[slot4].skill_name:setVisible(true)
					slot0.skill_item_list[slot4].lock_icon:setVisible(false)

					slot7 = slot6.level

					if slot6.client_lev and slot6.client_lev > 0 then
						slot7 = slot6.client_lev
					end

					slot0.skill_item_list[slot4].skill_level:setString(slot7)
					slot0.skill_item_list[slot4].skill_name:setString(slot6.name)

					if slot0.skill_item_list[slot4].record_icon == nil or slot0.skill_item_list[slot4].record_icon ~= slot6.icon then
						slot0.skill_item_list[slot4].record_icon = slot6.icon

						loadSpriteTexture(slot0.skill_item_list[slot4].icon, PathTool.getSkillRes(slot6.icon, false), LOADTEXT_TYPE)
					end
				end
			else
				slot0.skill_item_list[slot4].icon:setVisible(false)
				slot0.skill_item_list[slot4].lock_icon:setVisible(true)
				slot0.skill_item_list[slot4].skill_level_bg:setVisible(false)
				slot0.skill_item_list[slot4].skill_level:setVisible(false)

				slot6, slot7 = nil

				if slot0.select_hero_vo then
					slot6, slot7 = uv0:checkOpenTanlentByconfig(slot5, slot0.scdata)
				else
					slot6, slot7 = uv0:checkOpenTanlentByconfig(slot5, {
						star = 5
					})
				end

				slot8 = nil

				if slot6 then
					slot8 = PathTool.getResFrame("common", "common_90026")

					slot0.skill_item_list[slot4].skill_name_bg:setVisible(false)
					slot0.skill_item_list[slot4].skill_name:setVisible(false)
				else
					slot8 = PathTool.getResFrame("common", "common_90009")

					slot0.skill_item_list[slot4].skill_name_bg:setVisible(true)
					slot0.skill_item_list[slot4].skill_name:setVisible(true)
					slot0.skill_item_list[slot4].skill_name:setString(slot7)
				end

				loadSpriteTexture(slot0.skill_item_list[slot4].lock_icon, slot8, LOADTEXT_TYPE_PLIST)
			end
		end
	end
end

function HeroResonateTabEmpowermentPanel.updateCostInfo(slot0)
	if not slot0.scdata then
		return
	end

	slot0.is_show_redpoint = true
	slot2 = nil

	if Config.ResonateData.data_star_cost[slot0.scdata.star] and slot1.loss1 and next(slot1.loss1) ~= nil then
		slot3 = slot1.loss1[1][1] or 1
		slot4 = slot1.loss1[1][2] or 0

		slot0.cost_item:setBaseData(slot3, 1)

		slot5 = BackpackController:getInstance():getModel():getItemNumByBid(slot3)

		slot0.cost_item:setNeedNum(slot4, slot5)

		if slot5 < slot4 then
			slot0.is_show_redpoint = false
		end
	else
		if Config.ResonateData.data_star_cost[10] and slot2.loss1 and next(slot2.loss1) ~= nil then
			slot0.cost_item:setBaseData(slot2.loss1[1][1] or 1, 1)
		end

		slot0.is_show_redpoint = false
	end

	if slot1 and slot1.loss2 and next(slot1.loss2) ~= nil then
		for slot6 = 1, 1 do
			slot9 = slot0.cost_txt[slot6]

			if slot1.loss2[slot6] then
				slot11 = slot7[2]

				if Config.ItemData.data_get_data(slot7[1]) then
					slot0.cost_icon[slot6]:loadTexture(PathTool.getItemRes(slot12.icon), LOADTEXT_TYPE)

					slot13 = BackpackController:getInstance():getModel():getItemNumByBid(slot10)

					slot9:setString(MoneyTool.GetMoneyString(slot13) .. "/" .. MoneyTool.GetMoneyString(slot11))

					if slot11 <= slot13 then
						slot9:setTextColor(cc.c3b(255, 246, 228))
					else
						slot0.is_show_redpoint = false

						slot9:setTextColor(cc.c3b(253, 71, 71))
					end
				end
			else
				slot9:setString("")
			end
		end
	elseif slot2 and slot2.loss2 and next(slot2.loss2) ~= nil and Config.ItemData.data_get_data(slot2.loss2[1][1] or 1) and slot0.cost_icon[1] and slot0.cost_txt[1] then
		slot0.cost_icon[1]:loadTexture(PathTool.getItemRes(slot4.icon), LOADTEXT_TYPE)
		slot0.cost_txt[1]:setString(0)
	end

	if slot0.is_show_redpoint then
		if not slot0.select_hero_vo then
			slot0.hero_item_2:showRedPoint(true)
		else
			slot0.hero_item_2:showRedPoint(false)
		end
	else
		slot0.hero_item_2:showRedPoint(false)
	end
end

function HeroResonateTabEmpowermentPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function HeroResonateTabEmpowermentPanel.DeleteMe(slot0)
	if slot0.select_hero_event then
		GlobalEvent:getInstance():UnBind(slot0.select_hero_event)

		slot0.select_hero_event = nil
	end

	if slot0.select_skill_event then
		GlobalEvent:getInstance():UnBind(slot0.select_skill_event)

		slot0.select_skill_event = nil
	end

	if slot0.hero_power_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_power_event)

		slot0.hero_power_event = nil
	end

	if slot0.hero_resonate_empowerment_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_resonate_empowerment_event)

		slot0.hero_resonate_empowerment_event = nil
	end

	if slot0.hero_resonate_empowerment_success_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_resonate_empowerment_success_event)

		slot0.hero_resonate_empowerment_success_event = nil
	end

	if slot0.hero_resonate_skill_list_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_resonate_skill_list_event)

		slot0.hero_resonate_skill_list_event = nil
	end

	if slot0.modify_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_goods_event)

		slot0.modify_goods_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.del_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.del_goods_event)

		slot0.del_goods_event = nil
	end

	if uv0 and slot0.role_lev_event then
		uv0:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	if slot0.change_effect then
		slot0.change_effect:clearTracks()
		slot0.change_effect:removeFromParent()

		slot0.change_effect = nil
	end
end
