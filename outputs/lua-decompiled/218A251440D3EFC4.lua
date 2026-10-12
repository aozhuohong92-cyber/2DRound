HeroResonateTabStoneTabletPanel = class("HeroResonateTabStoneTabletPanel", function ()
	return ccui.Widget:create()
end)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = math.floor

function HeroResonateTabStoneTabletPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroResonateTabStoneTabletPanel.config(slot0)
	slot0.dic_config_level_up = {}
	slot0.dic_config_star_attr = {}

	if Config.ResonateData.data_const.attr_add_var1 then
		slot0.param_star = slot1.val
	else
		slot0.param_star = 10
	end

	slot0.hero_param = 100
end

function HeroResonateTabStoneTabletPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_resonate_tab_stone_tablet_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.level_panel = slot0.bottom_panel:getChildByName("level_panel")
	slot0.level_key = slot0.level_panel:getChildByName("key")

	slot0.level_key:setString(TI18N("增幅阶段:"))

	slot0.level_left = slot0.level_panel:getChildByName("left")
	slot0.level_arrow = slot0.level_panel:getChildByName("arrow_icon")
	slot0.level_right = slot0.level_panel:getChildByName("right")
	slot0.param_lay = slot0.bottom_panel:getChildByName("param_lay")
	slot2 = slot0.param_lay:getContentSize().height / 3
	slot0.param_list = {}

	for slot6 = 1, 3 do
		slot7 = slot2 * (3 - slot6) + slot2 * 0.5
		slot0.param_list[slot6] = {
			key = createRichLabel(22, cc.c3b(255, 255, 255), cc.p(0, 0.5), cc.p(0, slot7), nil, nil, 1900),
			left = createRichLabel(22, cc.c3b(255, 255, 255), cc.p(0, 0.5), cc.p(118, slot7), nil, nil, 1900),
			right = createRichLabel(22, cc.c3b(255, 255, 255), cc.p(0, 0.5), cc.p(335, slot7), nil, nil, 1900)
		}

		slot0.param_lay:addChild(slot0.param_list[slot6].key)
		slot0.param_lay:addChild(slot0.param_list[slot6].left)
		slot0.param_lay:addChild(slot0.param_list[slot6].right)
	end

	slot0.common_90034 = slot0.param_lay:getChildByName("common_90034")
	slot0.star_tips = createRichLabel(22, cc.c4b(255, 102, 34, 255), cc.p(0.5, 0.5), cc.p(360, 338), nil, nil, 1900)

	slot0.bottom_panel:addChild(slot0.star_tips)

	slot0.bottom_panel_x, slot0.bottom_panel_y = slot0.bottom_panel:getPosition()
	slot3 = slot0.bottom_panel:getChildByName("cost_icon_1")

	slot3:setScale(0.8)

	slot4 = slot0.bottom_panel:getChildByName("cost_icon_2")

	slot4:setScale(0.8)

	slot5 = slot0.bottom_panel:getChildByName("cost_txt_1")
	slot6 = slot0.bottom_panel:getChildByName("cost_txt_2")

	slot5:setString("")
	slot6:setString("")

	slot0.cost_icon = {
		slot3,
		slot4
	}
	slot0.cost_txt = {
		slot5,
		slot6
	}
	slot0.level_up_btn = slot0.bottom_panel:getChildByName("level_up_btn")
	slot0.level_up_btn_label = slot0.level_up_btn:getChildByName("label")

	slot0.level_up_btn_label:setString(TI18N("提 升"))

	slot0.look_btn = slot0.bottom_panel:getChildByName("look_btn")
end

function HeroResonateTabStoneTabletPanel.playEnterAnimatian(slot0)
	if not slot0.bottom_panel then
		return
	end

	commonOpenActionLeftMove(slot0.bottom_panel)
end

function HeroResonateTabStoneTabletPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.level_up_btn, function ()
		uv0:onClickLevelUpBtn()
	end, true, 2)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if uv0.parent and uv0.parent.is_move_effect then
			return
		end

		if Config.ResonateData.data_const.rule_tips then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 2, nil, 0.8)

	if slot0.hero_resonate_info_event == nil then
		slot0.hero_resonate_info_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Info_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0:setScData(slot0)
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

	if slot0.select_hero_event == nil then
		slot0.select_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Select_Hero_Event, function (slot0, slot1)
			if not uv0.select_pos then
				return
			end

			if slot1 and slot1 == HeroConst.SelectHeroType.eResonateStone then
				if slot0 == nil or next(slot0) == nil then
					if uv0.dic_hero_vo[uv0.select_pos] then
						uv1:sender26401(uv0.select_pos, uv0.dic_hero_vo[uv0.select_pos].id, 2)
					end
				else
					for slot5, slot6 in pairs(slot0) do
						if uv0.dic_hero_vo[uv0.select_pos] and slot5 == uv0.dic_hero_vo[uv0.select_pos].id then
							break
						end

						uv1:sender26401(uv0.select_pos, slot6.partner_id, 1)

						break
					end
				end

				uv0.select_pos = nil
			end
		end)
	end
end

function HeroResonateTabStoneTabletPanel.onClickHeroBtn(slot0, slot1)
	slot2, slot3 = slot0:checkPosLockByPos(slot1)

	if slot2 then
		message(slot3)

		return
	end

	if slot0.parent and slot0.parent.is_move_effect then
		return
	end

	if not slot0.dic_hero_vo then
		return
	end

	slot5 = 5

	if Config.ResonateData.data_const.hero_star_condition then
		slot5 = slot4.val
	end

	slot0.select_pos = slot1
	slot6 = {
		select_condition = {}
	}
	slot6.select_condition.star_start = slot5
	slot6.select_condition.camp_type = 0
	slot6.select_condition.bid = 0
	slot6.select_count = 1
	slot6.form_type = HeroConst.SelectHeroType.eResonateStone
	slot6.dic_selected = {}

	if slot0.dic_hero_vo[slot1] then
		slot6.dic_selected[slot0.dic_hero_vo[slot1].id] = slot0.dic_hero_vo[slot1]
	end

	slot6.dic_filter_selected = {}
	slot6.tips = TI18N("选择一个五星或以上星级的英雄配置到圣阵中")

	if uv0.dic_resonate_lock_info then
		for slot10, slot11 in pairs(uv0.dic_resonate_lock_info) do
			if slot6.dic_selected[slot11.id] == nil then
				slot6.dic_filter_selected[slot11.id] = slot11
			end
		end
	end

	uv1:openHeroSelectHeroPanel(true, slot6)
end

function HeroResonateTabStoneTabletPanel.onClickLevelUpBtn(slot0)
	if slot0.parent and slot0.parent.is_move_effect then
		return
	end

	uv0:sender26402()
end

function HeroResonateTabStoneTabletPanel.setData(slot0, slot1)
	slot0.parent = slot1
	slot0.is_init_hero = true

	if slot0.is_send_26400 then
		return
	end

	slot0.is_send_26400 = true

	uv0:sender26400()
end

function HeroResonateTabStoneTabletPanel.setScData(slot0, slot1)
	slot0.scdata = slot1

	if uv0:isResonateMaxLevel(slot0.scdata.lev) then
		slot0.level_panel:setPositionX(360)
		slot0.level_left:setString(slot0.scdata.lev)
		slot0.level_right:setString("")
		slot0.level_arrow:setVisible(false)
		slot0.cost_icon[1]:setVisible(false)
		slot0.cost_icon[2]:setVisible(false)
		slot0.cost_txt[1]:setVisible(false)
		slot0.cost_txt[2]:setVisible(false)
		slot0.bottom_panel:getChildByName("cost_bg_1"):setVisible(false)
		slot0.bottom_panel:getChildByName("cost_bg_2"):setVisible(false)
		slot0.level_up_btn:setVisible(false)

		if slot0.max_lev_str == nil then
			slot0.max_lev_str = createLabel(24, cc.c4b(248, 194, 60, 255), nil, 360, 256, TI18N("已经达到满级!"), slot0.bottom_panel, nil, cc.p(0.5, 0.5))
		end
	else
		slot0.level_left:setString(slot0.scdata.lev)
		slot0.level_right:setString(slot0.scdata.lev + 1)
		slot0.level_arrow:setVisible(true)
		slot0:updateCostInfo()
	end

	slot0.dic_hero_vo = {}

	for slot6, slot7 in ipairs(slot0.scdata.list) do
		if slot7.id ~= 0 and uv0:getHeroById(slot7.id) and next(slot8) ~= nil then
			uv1(slot0.dic_hero_vo, slot8)
		end
	end

	slot0:updateAttrInfo(slot0.scdata.attr, slot2)
end

function HeroResonateTabStoneTabletPanel.checkResonateStoneRedpoint(slot0)
	if uv0.is_resonate_stone_redpoint then
		addRedPointToNodeByStatus(slot0.level_up_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.level_up_btn, false, 5, 5)
	end
end

function HeroResonateTabStoneTabletPanel.runShowAction(slot0, slot1)
	if slot1 then
		if slot0.bottom_panel then
			slot0.bottom_panel:runAction(cc.Spawn:create(cc.MoveTo:create(0.8, cc.p(slot0.bottom_panel_x, -1000)), cc.FadeIn:create(0.8)))
		end
	else
		slot0.delayTime_param = slot0.parent.delayTime_param or 0.5

		if slot0.bottom_panel then
			slot0.bottom_panel:setPositionY(-1000)
			slot0.bottom_panel:runAction(cc.Sequence:create(cc.DelayTime:create(slot0.delayTime_param), cc.Spawn:create(cc.MoveTo:create(0.65, cc.p(slot0.bottom_panel_x, slot0.bottom_panel_y)), cc.FadeIn:create(0.65))))
		end
	end
end

function HeroResonateTabStoneTabletPanel.updateAttrInfo(slot0, slot1, slot2)
	if not slot0.scdata then
		return
	end

	if not slot0.dic_hero_vo then
		return
	end

	slot3 = uv0.resonate_max_partner_lev or 0

	if slot0.dic_config_level_up[slot0.scdata.lev] == nil then
		slot0.dic_config_level_up[slot0.scdata.lev] = Config.ResonateData.data_level_up(slot0.scdata.lev)
	end

	if slot0.dic_config_level_up[slot0.scdata.lev + 1] == nil then
		slot0.dic_config_level_up[slot0.scdata.lev + 1] = Config.ResonateData.data_level_up(slot0.scdata.lev + 1)
	end

	if slot0.dic_config_star_attr[slot3] == nil then
		slot0.dic_config_star_attr[slot3] = Config.ResonateData.data_star_attr(slot3)
	end

	slot5 = slot0.dic_config_level_up[slot0.scdata.lev + 1]
	slot6 = slot0.dic_config_star_attr[slot3]

	if slot0.dic_config_level_up[slot0.scdata.lev] == nil then
		return
	end

	slot7 = 0

	if slot6 then
		slot7 = slot6.rio
	end

	for slot11, slot12 in ipairs(slot4.attr) do
		slot13, slot14 = slot0:countLevelAttr(slot12[2], slot7, slot3)

		if slot0.param_list[slot11] then
			slot16, slot17, slot18 = commonGetAttrInfoByKeyValue(slot12[1], slot12[2])

			slot15.key:setString(uv1("<img src='%s' scale=1 /> %s:", slot16, slot17))
			slot15.left:setString(uv1("%s<div fontcolor=#249003>(+%s)</div>", slot13, slot14))

			if slot5 then
				slot22, slot23 = slot0:countLevelAttr(slot5.attr[slot11][2] or 0, slot7, slot3)

				slot15.right:setString(uv1("%s<div fontcolor=#249003>(+%s)</div>", slot22, slot23))
			else
				slot15.right:setString("")
			end
		end
	end

	if slot5 then
		slot0.common_90034:setVisible(true)
		slot0.param_lay:setPositionX(243)
	else
		slot0.common_90034:setVisible(false)
		slot0.param_lay:setPositionX(360)
	end

	slot0.star_tips:setString(uv1(TI18N("(历史供奉英雄最高总星数为:<div fontcolor=#249003>%s</div>, 星级加成:<div fontcolor=#249003>%s%%</div>)"), slot3, slot7 / 10))
end

function HeroResonateTabStoneTabletPanel.countLevelAttr(slot0, slot1, slot2)
	slot3 = slot1 or 0
	slot5 = slot3 * (slot2 or 0) / 1000

	return uv0(slot3 + slot5 + 0.5), uv0(slot5 + 0.5)
end

function HeroResonateTabStoneTabletPanel.updateCostInfo(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.dic_config_level_up[slot0.scdata.lev] == nil then
		slot0.dic_config_level_up[slot0.scdata.lev] = Config.ResonateData.data_level_up(slot0.scdata.lev)
	end

	if not slot0.dic_config_level_up[slot0.scdata.lev] then
		return
	end

	if slot1 and slot1.expend and next(slot1.expend) ~= nil then
		for slot5 = 1, 2 do
			slot8 = slot0.cost_txt[slot5]

			if slot1.expend[slot5] then
				slot10 = slot6[2]

				if Config.ItemData.data_get_data(slot6[1]) then
					slot0.cost_icon[slot5]:loadTexture(PathTool.getItemRes(slot11.icon), LOADTEXT_TYPE)

					slot12 = BackpackController:getInstance():getModel():getItemNumByBid(slot9)

					slot8:setString(MoneyTool.GetMoneyString(slot12) .. "/" .. MoneyTool.GetMoneyString(slot10))

					if slot10 <= slot12 then
						slot8:setTextColor(cc.c3b(255, 246, 228))
					else
						slot8:setTextColor(cc.c3b(255, 139, 139))
					end
				end
			else
				slot8:setString("")
			end
		end
	end

	slot0:checkResonateStoneRedpoint()
end

function HeroResonateTabStoneTabletPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function HeroResonateTabStoneTabletPanel.DeleteMe(slot0)
	if slot0.hero_resonate_info_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_resonate_info_event)

		slot0.hero_resonate_info_event = nil
	end

	if slot0.select_hero_event then
		GlobalEvent:getInstance():UnBind(slot0.select_hero_event)

		slot0.select_hero_event = nil
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

	doStopAllActions(slot0.main_container)
	doStopAllActions(slot0.bottom_panel)
end
