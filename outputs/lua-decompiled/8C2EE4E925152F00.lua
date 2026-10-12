HeroMainTabTalentPanel = class("HeroMainTabTalentPanel", function ()
	return ccui.Widget:create()
end)
slot0 = string.format
slot2 = HeroController:getInstance():getModel()
slot3 = table.insert
slot4 = RoleController:getInstance():getRoleVo()

function HeroMainTabTalentPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroMainTabTalentPanel.config(slot0)
	slot0.skill_item_list = {}
end

function HeroMainTabTalentPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_main_tab_talent_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.tab_panel = slot0.root_wnd:getChildByName("tab_panel")
	slot0.skill_look_btn = slot0.tab_panel:getChildByName("skill_look_btn")

	slot0.skill_look_btn:getChildByName("label"):setString(TI18N("霸气预览"))

	slot0.shop_btn = slot0.tab_panel:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("技能商城"))

	slot0.look_btn = slot0.tab_panel:getChildByName("look_btn")
	slot3 = {}

	for slot7, slot8 in pairs(Config.PartnerSkillData.data_partner_skill_pos or {}) do
		uv0(slot3, slot8)
	end

	function slot7(slot0, slot1)
		return slot0.pos < slot1.pos
	end

	table.sort(slot3, slot7)

	slot0.config_list = slot3

	for slot7 = 1, 3 do
		slot8 = slot3[slot7]
		slot9 = slot0.tab_panel:getChildByName("skill_panel" .. slot7)
		slot10 = {
			skill_panel = slot9,
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

	if slot0.skill_item_list[3] then
		slot0.skill_item_list[3].effect_node = slot0.skill_item_list[3].skill_panel:getChildByName("effect_node")
		slot0.skill_item_list[3].effect_node_2 = slot0.skill_item_list[3].skill_panel:getChildByName("effect_node_2")
		slot0.box_item_load = loadSpriteTextureFromCDN(slot0.skill_item_list[3].skill_panel:getChildByName("bg_box"), PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_talent_bg_1", false), ResourcesType.single, slot0.box_item_load)
		slot0.skill_bg_item_load = loadSpriteTextureFromCDN(slot0.skill_item_list[3].skill_panel:getChildByName("skill_bg"), PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_talent_bg", false), ResourcesType.single, slot0.skill_bg_item_load)
	end

	slot0.bg = slot0.tab_panel:getChildByName("bg")
	slot0.item_load = loadSpriteTextureFromCDN(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_talent_bg", false), ResourcesType.single, slot0.item_load)
end

function HeroMainTabTalentPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.skill_look_btn, function ()
		uv0:onClickLookBtn()
	end, true, 2, nil)
	registerButtonEventListener(slot0.shop_btn, function ()
		uv0:onClickShopBtn()
	end, true, 2, nil)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.PartnerSkillData.data_partner_skill_const.skill_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end

		slot4 = Config.PartnerData.data_partner_const.game_rule1
	end, true, 1)

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				for slot5, slot6 in pairs(slot1) do
					if Config.ItemData.data_skill_item_list[slot6.base_id] then
						delayRun(uv0, 1, function ()
							uv0:checkSkillLevelUpRedpoint()
						end)

						break
					end

					if slot6.base_id == uv1.talent_skill_cost_id then
						delayRun(uv0, 1, function ()
							uv0:checkSkillLevelUpRedpoint()
						end)

						break
					end
				end
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				for slot5, slot6 in pairs(slot1) do
					if Config.ItemData.data_skill_item_list[slot6.base_id] then
						delayRun(uv0, 1, function ()
							uv0:checkSkillLevelUpRedpoint()
						end)

						break
					end

					if slot6.base_id == uv1.talent_skill_cost_id then
						delayRun(uv0, 1, function ()
							uv0:checkSkillLevelUpRedpoint()
						end)

						break
					end
				end
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				for slot5, slot6 in pairs(slot1) do
					if Config.ItemData.data_skill_item_list[slot6.base_id] then
						delayRun(uv0, 1, function ()
							uv0:checkSkillLevelUpRedpoint()
						end)

						break
					end

					if slot6.base_id == uv1.talent_skill_cost_id then
						delayRun(uv0, 1, function ()
							uv0:checkSkillLevelUpRedpoint()
						end)

						break
					end
				end
			end
		end)
	end

	if not slot0.hero_get_talent_event then
		slot0.hero_get_talent_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Get_Talent_Event, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.hero_vo then
				return
			end

			for slot4, slot5 in ipairs(slot0) do
				if slot5.partner_id == uv0.hero_vo.partner_id then
					uv0:updteData()
				end
			end
		end)
	end

	if not slot0.hero_learn_talent_event then
		slot0.hero_learn_talent_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Learn_Talent_Event, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.hero_vo then
				return
			end

			if slot0.partner_id == uv0.hero_vo.partner_id then
				uv0:initSkillItemList()
				delayRun(uv0, 1, function ()
					uv0:checkSkillLevelUpRedpoint()
				end)
			end
		end)
	end

	if not slot0.hero_level_up_talent_event then
		slot0.hero_level_up_talent_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Level_Up_Talent_Event, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.hero_vo then
				return
			end

			if slot0.partner_id == uv0.hero_vo.partner_id then
				message(TI18N("技能升级成功"))
				uv0:initSkillItemList()
				delayRun(uv0, 1, function ()
					uv0:checkSkillLevelUpRedpoint()
				end)
			end
		end)
	end

	if not slot0.hero_forget_talent_event then
		slot0.hero_forget_talent_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Forget_Talent_Event, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.hero_vo then
				return
			end

			if slot0.partner_id == uv0.hero_vo.partner_id then
				uv0:initSkillItemList()
			end
		end)
	end
end

function HeroMainTabTalentPanel.onClickLookBtn(slot0)
	if not slot0.hero_vo then
		return
	end

	HeroController:getInstance():openArtifactSkillWindow(true, 2)
end

function HeroMainTabTalentPanel.onClickShopBtn(slot0)
	MallController:getInstance():openMallPanel(true, MallConst.MallType.SkillShop)
end

function HeroMainTabTalentPanel.onSkillClickByIndex(slot0, slot1, slot2)
	if not slot0.hero_vo then
		return
	end

	if slot0.hero_vo:isResonateHero() then
		message(TI18N("赋能英雄不可更换天赋"))

		return
	end

	if slot0.hero_vo:ishaveTalentData() then
		slot3, slot4 = uv0:checkOpenTanlentByconfig(slot2, slot0.hero_vo)

		if not slot3 then
			message(slot4)

			return
		end

		if slot0.hero_vo.talent_skill_list[slot2.pos] then
			uv1:openHeroTalentSkillLevelUpPanel(true, slot0.hero_vo, slot0.hero_vo.talent_skill_list[slot2.pos], slot2.pos)
		else
			uv1:openHeroTalentSkillLearnPanel(true, slot0.hero_vo, slot2.pos)
		end
	end
end

function HeroMainTabTalentPanel.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.hero_vo = slot1

	if slot1.is_open_talent then
		slot1.is_open_talent = nil

		slot1:Fire(HeroVo.UPDATE_Partner_ATTR, slot1)
		HeroCalculate.checkHeroRedPointByRedPointType(HeroConst.RedPointType.eRPTalent)
	end

	if slot0.parent and slot0.parent.is_hide_talent_Item and slot0.skill_item_list and slot0.skill_item_list[3] and slot0.skill_item_list[3].skill_panel then
		slot0.skill_item_list[3].skill_panel:setVisible(false)
	end

	if slot0.hero_vo:ishaveTalentData() then
		slot0:updteData()
	end
end

function HeroMainTabTalentPanel.updteData(slot0)
	if uv0.hero_info_upgrade_star_param4 < slot0.hero_vo.star then
		for slot4, slot5 in ipairs(slot0.skill_item_list) do
			if slot4 == 3 then
				if slot0.parent and slot0.parent.is_hide_talent_Item then
					slot5.skill_panel:setVisible(false)
				else
					slot5.skill_panel:setVisible(true)
				end
			else
				slot5.skill_panel:setPositionY(284)
			end
		end

		slot0.bg:setPositionY(242)
	else
		for slot4, slot5 in ipairs(slot0.skill_item_list) do
			if slot4 == 3 then
				slot5.skill_panel:setVisible(false)
			else
				slot5.skill_panel:setPositionY(266)
			end
		end

		slot0.bg:setPositionY(224)
	end

	slot0:initSkillItemList()
	slot0:checkSkillLevelUpRedpoint()
	slot0:checkOpenTanlentEffect()
end

function HeroMainTabTalentPanel.checkOpenTanlentEffect(slot0)
	if slot0.parent and slot0.parent.is_hide_talent_Item and slot0.parent.is_show_open_talent_effect then
		if slot0.skill_item_list and slot0.skill_item_list[3] and slot0.skill_item_list[3].skill_panel then
			slot0.skill_item_list[3].skill_panel:setVisible(false)
		end

		slot0.parent.is_hide_talent_Item = false

		slot0:showOnpenThirteenEffect(true)
	end
end

function HeroMainTabTalentPanel.initSkillItemList(slot0)
	if not slot0.hero_vo.talent_skill_list then
		return
	end

	for slot4, slot5 in ipairs(slot0.config_list) do
		if slot0.skill_item_list[slot4] then
			if slot4 == 3 and slot0.hero_vo.star <= uv0.hero_info_upgrade_star_param4 then
				break
			end

			if slot0.hero_vo.talent_skill_list[slot5.pos] then
				if Config.SkillData.data_get_skill(slot0.hero_vo.talent_skill_list[slot5.pos]) then
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

					if slot4 == 3 then
						slot0:showThirteenEffect1(true)

						if Config.PartnerSkillData.data_partner_awakening_skill and slot8[slot6.bid] then
							slot0:showThirteenEffect2(true)
						else
							slot0:showThirteenEffect2(false)
						end
					end
				end
			else
				slot0.skill_item_list[slot4].icon:setVisible(false)
				slot0.skill_item_list[slot4].lock_icon:setVisible(true)
				slot0.skill_item_list[slot4].skill_level_bg:setVisible(false)
				slot0.skill_item_list[slot4].skill_level:setVisible(false)
				slot0.skill_item_list[slot4].redPoint:setVisible(false)

				slot6, slot7 = uv0:checkOpenTanlentByconfig(slot5, slot0.hero_vo)
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

				if slot4 == 3 then
					slot0:showThirteenEffect1(false)
					slot0:showThirteenEffect2(false)
				end
			end
		end
	end
end

function HeroMainTabTalentPanel.checkSkillLevelUpRedpoint(slot0)
	if not slot0.hero_vo.talent_skill_list then
		return
	end

	for slot4, slot5 in ipairs(slot0.config_list) do
		if slot0.hero_vo.talent_skill_list[slot5.pos] then
			slot0.skill_item_list[slot4].redPoint:setVisible(HeroCalculate.checkSingleTalentSkillLevel(slot0.hero_vo.talent_skill_list[slot5.pos]))
		else
			slot0.skill_item_list[slot4].redPoint:setVisible(false)
		end
	end
end

function HeroMainTabTalentPanel.showOnpenThirteenEffect(slot0, slot1)
	if slot1 then
		if slot0.open_thirteen_effect == nil then
			uv0:runShakeScreemAction()

			slot0.open_thirteen_effect = createEffectSpine("E27805", cc.p(slot0.size.width / 2, slot0.size.height / 2), cc.p(0.5, 0.5), false, PlayerAction.action, function ()
				if not tolua.isnull(uv0) then
					uv0.open_thirteen_effect:setVisible(false)
					uv1:openSkillUnlockWindow(true, 0, {
						show_type = 2
					})
				end
			end)

			slot0.tab_panel:addChild(slot0.open_thirteen_effect, 1)
			slot0.open_thirteen_effect:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" and not tolua.isnull(uv0) and uv0.skill_item_list and uv0.skill_item_list[3] and uv0.skill_item_list[3].skill_panel then
					uv0.skill_item_list[3].skill_panel:setVisible(true)
				end
			end, sp.EventType.ANIMATION_EVENT)
		end
	elseif slot0.open_thirteen_effect then
		slot0.open_thirteen_effect:setVisible(false)
		slot0.open_thirteen_effect:removeFromParent()

		slot0.open_thirteen_effect = nil
	end
end

function HeroMainTabTalentPanel.showThirteenEffect1(slot0, slot1)
	if slot1 then
		if slot0.thirteen_effect == nil and slot0.skill_item_list and slot0.skill_item_list[3] and slot0.skill_item_list[3].effect_node then
			slot0.thirteen_effect = createEffectSpine("E27803", cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.skill_item_list[3].effect_node:addChild(slot0.thirteen_effect, 1)
		end
	elseif slot0.thirteen_effect then
		slot0.thirteen_effect:setVisible(false)
		slot0.thirteen_effect:removeFromParent()

		slot0.thirteen_effect = nil
	end
end

function HeroMainTabTalentPanel.showThirteenEffect2(slot0, slot1)
	if slot1 then
		if slot0.thirteen_effect2 == nil and slot0.skill_item_list and slot0.skill_item_list[3] and slot0.skill_item_list[3].effect_node_2 then
			slot0.thirteen_effect2 = createEffectSpine("E27804", cc.p(-9, 16), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.skill_item_list[3].effect_node_2:addChild(slot0.thirteen_effect2, 1)
		end
	elseif slot0.thirteen_effect2 then
		slot0.thirteen_effect2:setVisible(false)
		slot0.thirteen_effect2:removeFromParent()

		slot0.thirteen_effect2 = nil
	end
end

function HeroMainTabTalentPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function HeroMainTabTalentPanel.DeleteMe(slot0)
	slot0:showOnpenThirteenEffect(false)
	slot0:showThirteenEffect1(false)
	slot0:showThirteenEffect2(false)

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

	if slot0.hero_get_talent_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_get_talent_event)

		slot0.hero_get_talent_event = nil
	end

	if slot0.hero_learn_talent_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_learn_talent_event)

		slot0.hero_learn_talent_event = nil
	end

	if slot0.hero_level_up_talent_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_level_up_talent_event)

		slot0.hero_level_up_talent_event = nil
	end

	if slot0.hero_forget_talent_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_forget_talent_event)

		slot0.hero_forget_talent_event = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.box_item_load then
		slot0.box_item_load:DeleteMe()
	end

	slot0.box_item_load = nil

	if slot0.skill_bg_item_load then
		slot0.skill_bg_item_load:DeleteMe()
	end

	slot0.skill_bg_item_load = nil

	if uv0 and slot0.role_lev_event then
		uv0:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end
end
